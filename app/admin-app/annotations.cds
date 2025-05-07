using AdminService as service from '../../srv/cat-service';
annotate service.Voter with @(
    UI.SelectionFields : [
        age,
        gender,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
            Label : '{i18n>Firstname}',
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
            Label : '{i18n>Lastname}',
        },
        {
            $Type : 'UI.DataField',
            Value : age,
            Label : '{i18n>Age}',
        },
        {
            $Type : 'UI.DataField',
            Value : gender,
            Label : '{i18n>Gender}',
        },
        {
            $Type : 'UI.DataField',
            Value : voteSectionName,
            Label : '{i18n>Votesectionname}',
        },
        {
            $Type : 'UI.DataField',
            Value : votedCanditade.firstName,
            Label : '{i18n>Firstname}',
        },
        {
            $Type : 'UI.DataField',
            Value : votedCanditade.lastName,
            Label : '{i18n>Lastname}',
        },
    ],
);

annotate service.Voter with {
    age @Common.Label : 'age'
};

annotate service.Voter with {
    gender @Common.Label : 'gender'
};

