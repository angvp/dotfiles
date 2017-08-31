/* eslint-env jest */
describe('description of your tests', () => {
  it('is a simple obj comparison will always pass', () => {
    const someVar = {
      test: 'template'
    }
    const otherVar = {
      test: 'template'
    }
    expect(someVar).toMatchObject(otherVar)
  })
}
