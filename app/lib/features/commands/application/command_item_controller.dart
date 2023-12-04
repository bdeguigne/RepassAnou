// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:repasse_anou/utils/messenger_controller.dart';
// import 'package:repasse_anou/features/commands/data/command_item_repository.dart';
// import 'package:repasse_anou/features/commands/models/command_item.dart';

// class CommandItemController extends StateNotifier<List<CommandItem>> {
//   CommandItemController(
//     this._messengerController,
//     this._commandItemService,
//   ) : super([]);

//   final MessengerController _messengerController;
//   final CommandItemRepository _commandItemService;

//   void updateCommandItems(List<CommandItem> commandItems) {
//     state = commandItems;
//   }

//   Future<void> fetchCommandItems() async {
//     final commandItemsRequest = await _commandItemService.getCommandItems();

//     commandItemsRequest.fold(
//       (l) => _messengerController.showErrorSnackbar(l.message),
//       (commandItems) {
//         updateCommandItems(commandItems);
//       },
//     );
//   }
// }

// final commandItemControllerProvider =
//     StateNotifierProvider<CommandItemController, List<CommandItem>>(
//   (ref) => CommandItemController(
//     ref.read(messengerControllerProvider),
//     ref.read(commandItemRepositoryProvider),
//   ),
// );
