using {roaep.VotingSimulator as vote} from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service VoterService {
    @readonly
    entity NationWideResults as
        projection on vote.Candidate {
            firstName,
            lastName,
            (
                select COUNT(ID) from vote.Voter
                where
                    votedCanditade.ID = Candidate.ID
            ) as totalVotes : Integer
        }

}


service AnalyticService {
    @readonly
    entity Resulsts as projection on vote.Voter;
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
        votingSection_ID
    ],
    AggregatableProperties: [{Property: ID}],
});

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
