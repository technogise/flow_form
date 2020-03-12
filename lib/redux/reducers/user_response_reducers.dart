import 'package:redux/redux.dart';
import '../../user_response.dart';
import '../actions/actions.dart';

///Variable to store dashboard node reducers
final Reducer<UserResponse> userResponseReducer =
    combineReducers<UserResponse>([
  TypedReducer<UserResponse, CaptureUserResponse>(captureResponse),
]);

///Set value of dashboard node
UserResponse captureResponse(
  UserResponse capturedResponse,
  CaptureUserResponse action,
) {
  capturedResponse.add(action.toUpdate);
  return capturedResponse;
}
