using { roaep.VotingSimulator as vote } from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service VoterService { 
    @readonly entity NationWideResults as projection on vote.Candidate {
        firstName,
        lastName,
        (SELECT COUNT(ID) FROM vote.Voter WHERE votedCanditade.ID = Candidate.ID) as totalVotes : Integer
    }

}

service AdminService {

    entity Voter as projection on vote.Voter{
        *,
        votingSection.name as voteSectionName
    };
    entity VotingSection as projection on vote.VotingSection;
    entity Candidate as projection on vote.Candidate;
}
