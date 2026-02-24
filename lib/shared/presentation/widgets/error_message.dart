import 'package:flutter/material.dart';

class ErrorMessage extends StatefulWidget {

	static const int up = 0;
	static const int down = 1;

	final String circumstances;
	final String error;
	final int direction;
	final Color? textColor;
	final double offset;

	const ErrorMessage({
		super.key, 
		required this.circumstances,
		required this.error,
		this.direction = up,
		this.textColor,
		this.offset = 8,
	});

	@override
	State<ErrorMessage> createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {

	final OverlayPortalController _controller = OverlayPortalController();
	final GlobalKey _anchorKey = GlobalKey();
	final LayerLink _link = LayerLink();

	@override
	Widget build(BuildContext context) {
		return Padding(
		  padding: const EdgeInsets.all(8.0),
		  child: CompositedTransformTarget(
				link: _link,
		    child: RichText(
		    	key: _anchorKey,
		    	softWrap: true,
		    	textAlign: TextAlign.left,
		    	text: TextSpan(children: [
		    		TextSpan(
		    			text: "⚠️ Произошла ",
		    			style: TextStyle(
		    				color: widget.textColor ?? Colors.red,
		    			),
		    		),
		    		WidgetSpan(
		    			alignment: PlaceholderAlignment.middle,
		    			child: MouseRegion(
		    				onEnter: (_) => _controller.show(),
		    				onExit: (_) => _controller.hide(),
		    				cursor: SystemMouseCursors.click,
		    				child: OverlayPortal(
		    					controller: _controller,
		    					overlayChildBuilder: (BuildContext context) { 
										RenderBox? box = _anchorKey.currentContext?.findRenderObject() as RenderBox;
										Offset offset = box.localToGlobal(Offset.zero);
										return Stack(
											children: [
												ModalBarrier(
													color: Color.fromARGB(64, 0, 0, 0),
													onDismiss: _controller.hide,
												),
												Positioned(
													left: 0,
													top: 0,
													child: CompositedTransformFollower(
														link: _link,
														targetAnchor: widget.direction == ErrorMessage.up ? Alignment.topLeft : Alignment.bottomLeft,
														followerAnchor: widget.direction == ErrorMessage.up ? Alignment.bottomLeft : Alignment.topLeft,
														offset: Offset(
															-offset.dx + 16,
															widget.direction == ErrorMessage.up ? 
															-widget.offset : widget.offset
														),
														child: ConstrainedBox(
															constraints: BoxConstraints(
																maxWidth: box.constraints.maxWidth - 16
															),
															child: Container(
																decoration: BoxDecoration(
																	border: BoxBorder.all(
																		width: 2,
																	),
																	borderRadius: BorderRadius.all(Radius.elliptical(10, 5)),
																	color: Color.lerp(Colors.red, Colors.white, 0.8)!,
																	backgroundBlendMode: BlendMode.screen
																),
																child: Container(
																	decoration: BoxDecoration(
																		shape: BoxShape.rectangle,
																		gradient: LinearGradient(
																			stops: [0, 0.05, 0.95, 1],
																			colors: [
																				Color.fromARGB(128, 16, 16, 16),
																				Color.fromARGB(180, 16, 16, 16),
																				Color.fromARGB(200, 16, 16, 16),
																				Color.fromARGB(128, 16, 16, 16),
																			],
																		),
																	),
																	child: Padding(
																		padding: const EdgeInsets.all(8.0),
																		child: Text(
																			widget.error,
																			textAlign: TextAlign.center,
																			softWrap: true,
																			style: TextStyle(
																				color: Colors.white
																			),
																		),
																	),
																),
															),
														),
													)
												),
											],
										);
									},
									child: GestureDetector(
										onTap: _controller.toggle,
										child: ShaderMask(
											blendMode: BlendMode.srcIn,
											shaderCallback: (Rect bounds) {
												return LinearGradient(
													begin: Alignment.centerLeft,
													end: Alignment.centerRight,
													colors: [
														Color.lerp(widget.textColor ?? Colors.red, Colors.black, 0.15)!,
														Color.lerp(widget.textColor ?? Colors.red, Colors.black, 0.25)!,
													]
												).createShader(bounds);
											},
											child: Text(
												"ошибка",
												style: TextStyle(
													fontWeight: FontWeight.w900,
													decoration: TextDecoration.underline,
													decorationStyle: TextDecorationStyle.dotted,
													decorationThickness: 2,
												),
											),
										),
									),
								),
							),
						),
						TextSpan(
							text: " при ${widget.circumstances}. Повторите попытку позже.",
							style: TextStyle(
								color: widget.textColor ?? Colors.red,
							),
						),
					])),
			),
		);
	}
}

