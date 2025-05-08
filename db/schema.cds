using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
namespace roaep.VotingSimulator; 

/*
 - sectie de votare: id, nume, regiune
 - evidenta voturi (intemediar n:m)
 - canditat: id, nume, partid
 - statistici: canditati, voturi
 - votati (cine e arondat cui)
*/

aspect personalInfo {
  firstName : String;
  lastName  : String;
  gender    : String enum {Male; Female; NonBinary};
  age       : Integer
}


entity Voter : cuid, personalInfo, managed {
  votingSection  : Association to one VotingSection;
  votedCanditade : Association to one Candidate;
}

entity VotingSection : cuid, managed {
  name   : String;
  region : String;
  voters : Association to many Voter on voters.votingSection = $self;
}

entity Candidate : cuid, personalInfo, managed {
  party : String;
  imageURL: String;
}