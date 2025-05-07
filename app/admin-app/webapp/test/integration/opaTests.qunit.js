sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'vote/adminapp/test/integration/FirstJourney',
		'vote/adminapp/test/integration/pages/VoterList',
		'vote/adminapp/test/integration/pages/VoterObjectPage'
    ],
    function(JourneyRunner, opaJourney, VoterList, VoterObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('vote/adminapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheVoterList: VoterList,
					onTheVoterObjectPage: VoterObjectPage
                }
            },
            opaJourney.run
        );
    }
);