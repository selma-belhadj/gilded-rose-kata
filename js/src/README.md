1. Use let instead of var
    > let allows you to declare variables that are limited to the scope of a block statement, or expression on which it is used, unlike the var keyword, which declares a variable globally, or locally to an entire function regardless of block scope
2. Variable and function names are written in camelCase
   1. Choose a word with meaning (provide some context)
   2. Attach additional information to a name (use suffix or prefix)
3. Don’t repeat yourself (DRY)
4. you aren’t gonna need it (YAGNI)
5. keep it simple, stupid principle (KISS)
6. Avoid conditionals whenever possible. Use polymorphism and inheritance instead.
7. The forEach method can be used to achieve the same results as the for loop, but it has some benefits over the for loop.

> The forEach method is easier to read and understand.

> The forEach method does not require you to create a loop counter variable.

> The forEach method is less likely to cause an infinite loop.

> The forEach method can be used with arrow functions, which makes the code even more concise and easier to read.

Review and Improvement of gilded-rose-kata repo: Js code
> ## What does this PR do?

- This PR is raised to review & improve the js code in this forked repo

## Description of the task to be completed

- Suggest DRY, KISS, YAGNI pieces of code
- Suggest renaming variables and functions following the best practices of JS
- Suggest using let instead of var
- Suggest using forEach instead of for
- Define Item as a class instead of just function & define needed methods
- Add tests for item class methods using jest framework
- Add tests for updateQuality method using jest framework

## How should it be tested

- clone the repository by running
``` git clone https://github.com/CircleCI-Archived/gilded-rose-kata.git ```
- navigate to the folder
``` cd gilded-rose-kata ```
- Install packages
``` npm install ```
- Run the app
``` npm start ```
- Run the test 
`npm run test`
