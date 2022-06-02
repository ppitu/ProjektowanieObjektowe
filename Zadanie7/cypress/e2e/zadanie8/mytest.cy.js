context('My Test1', () => {
	beforeEach(() => {
		cy.visit('https://example.cypress.io/commands/assertions')
	})

	describe('MyTest1', () => {
		it('Test1', () => {
			cy.get('.assertion-table')
				.find('tbody tr:last')
				.should('have.class', 'success')
		})

		it('Test2', () => {
			cy.get('#should')
				.find('a')
				.should('have.attr', 'href')
		})

		it('Test3', () => {
			cy.get('#and')
				.find('a')
				.should('have.attr', 'href')
		})
		it('Test4', () => {
			cy.get('#expect').then(($el) => {
				const text = $el.text()

				expect(text).to.eq("expect")
			})
		})
		it('Test5', () => {
			cy.get('#assert').then(($el) => {
				const text = $el.text()

				expect(text).to.eq("assert")
			})
		})
		it('Test6', () => {
			cy.get('#should')
				.find('a')
				.then(($el) => {
					const text = $el.text()

					expect(text).to.eq(".should()")
				})
		})
		it('Test7', () => {
			cy.get('#and')
				.find('a')
				.then(($el) => {
					const text = $el.text()

					expect(text).to.eq(".and()")
				})
		})
		it('Test8', () => {
			cy.get('.navbar')
				.find('a')
				.should('have.attr', 'href')
		})
		it('Test9', () => {
			cy.get('.navbar')
				.find('div')
				.first()
				.should('have.attr', 'class')
		})
		it('Test10', () => {
			cy.get('.navbar')
				.find('button')
				.should('have.attr', 'type')
		})
		it('Test11', () => {
			cy.get('.navbar')
				.find('button')
				.should('have.attr', 'class')
		})
		it('Test12', () => {
			cy.get('.navbar')
				.find('button')
				.should('have.attr', 'data-toggle')
		})


		it('Test13', () => {
			cy.get('.assertions-link')
				.should('have.class', 'active')
				.and('have.attr', 'href')
				.and('include', 'cypress.io')
		})

		it('Test14', () => {
			expect(true).to.be.true
			const o = { foo: 'bar' }

			expect(o).to.equal(o)
			expect(o).to.deep.equal({ foo: 'bar' })
			expect('FooBar').to.match(/bar$/i)
		})

		it('Test15', () => {
			cy.get('.assertions-p')
				.find('p')
				.should(($p) => {
					const texts = $p.map((i, el) => Cypress.$(el).text())

					const paragraphs = texts.get()

					expect(paragraphs, 'has 3 paragraphs').to.have.length(3)

					expect(paragraphs, 'has expected text in each paragraph').to.deep.eq([
						'Some text from first p',
						'More text from second p',
						'And even more text from third p',
					])
				})
		})

		it('Test16', () => {
			cy.get('.docs-header')
				.find('div')
				.should(($div) => {
					expect($div).to.have.length(1)

					const className = $div[0].className

					expect(className).to.match(/heading-/)
				})
				.then(($div) => {
					expect($div, 'text content').to.have.text('Introduction')
				})
		})

		it('Test17', () => {
			cy.get('.docs-header')
				.find('div')
				.should(($div) => {
					if ($div.length !== 1) {
						throw new Error('Did not find 1 element')
					}

					const className = $div[0].className

					if (!className.match(/heading-/)) {
						throw new Error(`Could not find class "heading-" in ${className}`)
					}
				})
		})

		it('Test18', () => {
			let text

			const normalizeText = (s) => s.replace(/\s/g, '').toLowerCase()

			cy.get('.two-elements')
				.find('.first')
				.then(($first) => {
					// save text from the first element
					text = normalizeText($first.text())
				})

			cy.get('.two-elements')
				.find('.second')
				.should(($div) => {
					// we can massage text before comparing
					const secondText = normalizeText($div.text())

					expect(secondText, 'second text').to.equal(text)
				})
		})

		it('Test19', () => {
			const person = {
				name: 'Joe',
				age: 20,
			}

			assert.isObject(person, 'value is object')
		})

		it('Test20', () => {
			cy.get('#random-number')
				.should(($div) => {
					const n = parseFloat($div.text())

					expect(n).to.be.gte(1).and.be.lte(10)
				})
		})
	})
})
