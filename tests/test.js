const cds = require('@sap/cds/lib')
const { default: axios } = require('axios')
const { GET, POST, DELETE, PATCH, expect } = cds.test(__dirname + '../../')

axios.defaults.auth = { username: 'incident.support@tester.sap.com', password: 'initial' }

jest.setTimeout(11111)

describe('Test The GET Endpoints', () => {
    it('Should check Analytic Service', async () => {
        const analyticService = await cds.connect.to('AnalyticService')
        const { Resulsts } = analyticService.entities
        expect(await SELECT.from(Resulsts)).to.have.length(1000)
    })
})
