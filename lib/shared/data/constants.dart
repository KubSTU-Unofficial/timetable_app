// Потом нужно будет заменить на получение из API
import 'package:timetable_app/shared/data/models/class/lessons_dto.dart';

List<String> institutes = [
	"ФЭУБ",
	"ФНГЭ",
	"ФИТК",
	"ФБПП",
	"ФАСАД",
	"ФИМТ",
	"ФФН",
	"ИТК",
];
List<String> groups = [
	"22-КБ-ИВ1",
	"22-КБ-ИВ2",
	"22-КБ-ИВ3",
	"22-КБ-ИВ4",
	"22-КБ-ИВ5",
	"22-КБ-ИВ6",
	"22-КБ-ИВ7",
	"22-КБ-ИВ8",
	"22-КБ-ИВ9",
	"22-КБ-ИВ10",
	"22-КБ-ИВ11",
	"22-КБ-ИВ12",
	"22-КБ-ИВ13",
	"22-КБ-ИВ14",
	"22-КБ-ИВ15",
	"22-КБ-ИВ16",
];

List<LessonDTO> lessonsTestExample = [
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Основы теории основ",
		type: 0,
		teacherName: "Иванов Иван Иванович",
		classroom: "А-123",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 1,
			weeks: WeeksDTO(
				from: 1,
				to: 12,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: false,
				dayOfWeek: 1
			),

			date: null
		),

		percentOfGroup: null,
		isStream: null,
		isDistant: null,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "История Руси",
		type: 1,
		teacherName: "Григорьева Галина Генадиевна",
		classroom: "А-122",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 2,
			weeks: WeeksDTO(
				from: 1,
				to: 12,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: false,
				dayOfWeek: 2
			),

			date: null
		),

		percentOfGroup: 50,
		isStream: null,
		isDistant: null,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Теория алгоритмических задач расчёта мер воздействия в автоматических информационных системах",
		type: 2,
		teacherName: "Галушко Иван Фёдорович",
		classroom: "А-134",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 3,
			weeks: WeeksDTO(
				from: 1,
				to: 6,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: true,
				dayOfWeek: 3
			),

			date: null
		),

		percentOfGroup: null,
		isStream: null,
		isDistant: null,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Квантовая физическая культура",
		type: 1,
		teacherName: "Запрудь Зинаида Семёновна",
		classroom: "Ф",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 1,
			weeks: WeeksDTO(
				from: 1,
				to: 12,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: true,
				dayOfWeek: 4
			),

			date: null
		),

		percentOfGroup: null,
		isStream: null,
		isDistant: null,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Математическое моделирование математических моделей",
		type: 0,
		teacherName: "Загоров Михаил Сергеевич",
		classroom: "К-422",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 3,
			weeks: WeeksDTO(
				from: 6,
				to: 12,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: true,
				dayOfWeek: 2
			),

			date: null
		),

		percentOfGroup: null,
		isStream: true,
		isDistant: false,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Английский язык в профессиональной сфере в России",
		type: 0,
		teacherName: "Щекочихин-Крестовоздвиженский Пантелеймон Апполинариевич",
		classroom: "А-114",
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 1,
			weeks: WeeksDTO(
				from: 1,
				to: 12,
				startDate: DateTime(2026, 1, 15),
				endDate: DateTime(2026, 6, 12),
				isEven: true,
				dayOfWeek: 3
			),

			date: null
		),

		percentOfGroup: null,
		isStream: null,
		isDistant: null,
		comment: '',
	),
	LessonDTO(
		group: "22-КБ-ИВ1",
		name: "Null-безопасность жизнедеятельности",
		type: 0,
		teacherName: null,
		classroom: null,
		timing: TimingDTO(
			year: 2026,
			semester: 2,
			lessonNumber: 1,
			weeks: null,
			date: DateTime(2026, 2, 11)
		),

		percentOfGroup: null,
		isStream: null,
		isDistant: true,
		comment: '',
	),
];
