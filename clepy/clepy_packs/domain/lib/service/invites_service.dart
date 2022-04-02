import 'package:domain/domain.dart';
import 'package:domain/repository/invites_repository.dart';

class InvitesServie extends InvitesRepository {
  Future<bool> ValidInvite(String invite) async {
    bool isValid = false;
    ClepyQuery query = ClepyQuery(
      'inviteCode',
      isEqualTo: invite,
    );

    await get([query]).then((value) {
      isValid = value.docs.isEmpty ? false : true;
    });
    return isValid;
  }
}
