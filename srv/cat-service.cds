using {roaep.VotingSimulator as vote} from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service VoterService {
    @readonly
    entity NationWideResults as
        projection on vote.Candidate {
            key firstName,
                lastName,
                (
                    select COUNT(ID) from vote.Voter
                    where
                        votedCanditade.ID = Candidate.ID
                ) as totalVotes : Integer
        }

}

annotate VoterService.NationWideResults with @(requires: 'voter');

service AnalyticService {
    @readonly
    entity Resulsts   as
        projection on vote.Voter {
            *,
            votingSection.name       as voteSectionName,
            votedCanditade.firstName as votedCanditadeFirstName,
            votedCanditade.lastName  as votedCanditadeLastName,
            votedCanditade.party     as votedCanditadeParty,

        };

    @readonly
    entity Sections   as projection on vote.VotingSection;

    @readonly
    entity Candidates as projection on vote.Candidate;
}


annotate AnalyticService.Resulsts with @(Aggregation.ApplySupported: {
    Transformations       : [
        'aggregate',
        'topcount',
        'bottomcount',
        'identity',
        'concat',
        'groupby',
        'filter',
        'search'
    ],

    Rollup                : #None,
    // Specify the rollup type if needed
    PropertyRestrictions  : true,
    // Enforce restrictions on properties for aggregation or grouping
    GroupableProperties   : [
        votedCanditade_ID,
        votingSection_ID,
        voteSectionName,
        votedCanditadeFirstName,
        votedCanditadeLastName,
        votedCanditadeParty
    ],
    AggregatableProperties: [{Property: ID}],
});


annotate AnalyticService.Resulsts with @(requires: 'voter');

service AdminService {

    entity Voter         as
        projection on vote.Voter {
            *,
            votingSection.name as voteSectionName
        };

    entity VotingSection as projection on vote.VotingSection;
    entity Candidate     as projection on vote.Candidate;
}

annotate AdminService.Voter with @odata.draft.enabled;
annotate AdminService.Voter with @(requires: 'admin');
