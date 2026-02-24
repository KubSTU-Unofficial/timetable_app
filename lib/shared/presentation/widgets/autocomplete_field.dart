import 'package:flutter/material.dart';

// Shared
import 'package:timetable_app/shared/presentation/theme/theme_getter_ext.dart';

class AutocompleteField<T> extends StatefulWidget {
  const AutocompleteField({
		super.key,
		required this.controller,
		required this.optionsBuilder,
		this.label,
		this.onSelected,
	});

	final TextEditingController controller;
	final AutocompleteOptionsBuilder<String> optionsBuilder;
	final void Function(T)? onSelected;
	final String? label;

  @override
  State<AutocompleteField> createState() => _AutocompleteFieldState();
}

class _AutocompleteFieldState extends State<AutocompleteField> {

	final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
		return Autocomplete<String>(
		focusNode: _focusNode,
		textEditingController: widget.controller,
		optionsBuilder: widget.optionsBuilder,
		// optionsBuilder: ,
		fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
			return TextFormField(
				controller: textEditingController,
				focusNode: focusNode,
				// Если нужна заливка, раскомментируй filled и подгони цвет текста в style
				style: TextStyle(color: context.colors.textPrimary), // Цвет вводимого текста
					decoration: InputDecoration(
						// filled: true,
						labelStyle: TextStyle(color: Colors.grey),
						hintText: widget.label,
						hintStyle: TextStyle(color: context.colors.textSecondary),
						fillColor: context.colors.cardBackground,
						enabledBorder: OutlineInputBorder(
							borderRadius: BorderRadius.circular(8),
							borderSide: BorderSide(
								color: context.colors.borderEnabled,
								width: 1.0,
							),
						),
						focusedBorder: OutlineInputBorder(
							borderRadius: BorderRadius.circular(8),
							borderSide: BorderSide(
								color: context.colors.borderFocused,
								width: 1.0,
							),
						),
					),
				);
			},
			optionsViewBuilder: (context, onSelected, options) {
				final ScrollController controller = ScrollController();
				return Align(
					alignment: Alignment.topCenter,
					child: Padding(
					  padding: const EdgeInsets.only(top: 4),
					  child: Material(
					  	elevation: 4.0,
					  	color: Colors.grey[900], // ФОН ВЫПАДАЮЩЕГО СПИСКА
					  	borderRadius: BorderRadius.circular(8),
					  	child: Container(
					  		width: MediaQuery.of(context).size.width - 32, // Ширина списка
					  		constraints: const BoxConstraints(maxHeight: 200), // Ограничение высоты
					  		child: Padding(
					  			padding: const EdgeInsets.all(8.0),
					  			child: RawScrollbar(
										controller: controller,
										trackVisibility: true,
										thumbVisibility: true,
										trackBorderColor: context.colors.background,
										thickness: 8,
					  			  child: ListView.builder(
											controller: controller,
					  			  	padding: EdgeInsets.zero,
					  			  	shrinkWrap: true,
					  			  	itemCount: options.length,
					  			  	itemBuilder: (BuildContext context, int index) {
					  			  		final String option = options.elementAt(index);
					  			  		return ListTile(
					  			  			title: Text(option, style: TextStyle(color: context.colors.textInverse)),
					  			  			onTap: () => onSelected(option),
					  			  		);
					  			  	},
					  			  ),
					  			),
					  		),
					  	),
					  ),
					),
				);
			},
			onSelected: widget.onSelected,
			// onSelected: ,
		);
	}
}
