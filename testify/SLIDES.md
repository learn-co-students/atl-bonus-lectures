## Testify: A Refactoring Lecture

---

### Disclaimer

--

* This lecture is inspired by talks from Sandi Metz and James Dabbs.

> If you like this lecture, I would strongly encourage you to watch their talks as well!
> Start with [All the Little Things][sandi] and then see James' [Refactoring Live][james].

--

* The talking:livecoding ratio may feel different than usual lectures, the goal of these talks is to make you think differently about code.

--

* Please feel free to stop me and ask questions at any point.

[sandi]: https://www.youtube.com/watch?v=8bZh5LMaSmE
[james]: https://www.youtube.com/watch?v=LhX5COR8WXc

---

### Objectives

--

* Have a clear sense of why tests are not only important but necessary
* Know working definitions of "Refactoring" and "Legacy Code"
* See tools like: code coverage, watch commands
* Be able to trap an execution path for refactoring

--

### Guiding Questions

* How would you define refactoring?

--

* Okay. What about legacy code?

--

* Who stopped to look at a bug in the last month and didn't remember how the code was even _supposed to work_?

---

### Task

--

* There is a class called GildedRose. Your boss says it has 6 skipped tests for a new feature that needs to be implemented. 

--

* You look at the code and recoil in horror.

--

* All the engineers that knew anything about it have quit.

--

* Figure out how to make the tests pass without going insane.

--

### GildedRose

1. See the tests: `open src/App.test.js`
2. Run the tests: `yarn test`
3. See the code:  `open src/App.js`

---

### ... Quit Immediately? [y/n]

![lol-no](https://media.giphy.com/media/nLhdSinRtaL2E/giphy.gif)

---

### Questions

* Can we unskip the tests and implement the feature?

--

* Should we?

--

### Two Steps to Beat Bad Code

1. Make the Change Easy (warning: this step might be hard)
2. Make the Easy Change

---

### You Won't Believe this one Refactoring Trick

Refactoring the whole thing at once is a deathwish.

So instead, try to break apart a piece of the code and redirect it
to a _new_ method or class. Those tests should **start failing**.

That means you redirected that section of the code successfully!
Now make those tests pass and repeat until you've broken the whole thing apart.

--

> By turning a big, complicated thing into many small, knowable things we win.

---

### Refactor Road

1. Trap and fix Normal
2. Trap and fix Brie
3. Trap and fix Sulfuras
4. Trap and fix Backstage
5. Fix skipped tests?

--

### The Lunch Decision

Now, based on time, we can:

* Maybe convert these methods to separate classes?
* Maybe refactor the GildedRose class to be an ItemFactory?
* Fix skipped tests.

--

## 🎉🎉🎉🎉

---

### A "Real World" Example for the Unconvinced

At my last company, I worked with some very smart people including
an engineer who is one of the [top 3 github contributors to Redux][redux].

Basically, our app powered the house search on real estate agents websites.

[redux]: https://github.com/reduxjs/redux/graphs/contributors

--

One day, we were starting to see some performance issues with viewing Leads (visitors)
I checked the Rails controller to see why it was slow and found [this][leads].

[leads]: https://github.com/showcaseidx/ken/blob/880ba05dc3b785546168ea8205263f26ece49e0d/app/controllers/api/leads_controller.rb#L48

--

The problem wound up being that a SQL query on a big table wasn't hitting an index.
The important thing is it was _way_ harder to find because I had to deal with this
code. We aren't bad programmers. What went wrong here?

--

My answer: Programmers [follow the pattern][teams] that's already there. Just like looking up similar code when adding a new feature. And the more times you follow the pattern, the bigger it gets, so the harder it is to break away. At a certain point, the only way to "disobey" the pattern is to rip the thing up and start over.

[teams]: https://github.com/showcaseidx/ken/blob/master/app/controllers/api/teams_controller.rb

---

### Why Test?

#### Software is never finished.

* Real software lives a long time so inevitably the engineers that know why it was written "like that" disappear. (Sometimes it's even you forgetting what old you knew!)

--

* It exists in a social context to meet human needs. But human needs change all the time so software has to change too!

--

> Every program is part of some other program and rarely fits. - Alan Perlis
  
--

#### Tests are about confidence in changing code you _didn't write_ or _don't remember_.

I think most people get the message "tests keep you from breaking stuff later". That's true.

Equally important is the fact that tests mean you can rewrite the code at any time which happens a lot because _the code is never finished so it is always changing_ ... and sooner or later the changes don't fit.

--

The only way I know of to refactor without fear is if you have tests.

---

### Takeaways

* We need tests as a wall at our back so changing code doesn't become _impossible_.
  (Because eventually the changes needed are deep.)
* Legacy Code is code that has been abandoned from an engineering perspective but is still in production.
* By having tests and "redirecting" a segment of the functionality, we can rewrite in pieces without ever leaving the app committed in a broken state.
* The code will get temporarily worse as you refactor since you have to add more code before you can delete the bad code.

---

# Thank You <3

### Additional Resources

[Sandi Metz - All The Little Things][sandi]
[Institutional Memory and Reverse Smuggling][reverse-smuggling]
[The parts of a test][rspec-given]

[reverse-smuggling]: https://web.archive.org/web/20120207113424/http://wrttn.in/04af1a
[rspec-given]: https://github.com/jimweirich/rspec-given#given

---

### My Definitions

--

> Tech Debt(n): Code that people always start explaining by saying "Well, it's like this because..."

--

> Refactoring(n): Rewriting code while _maintaining behavior_ to simplify future changes.

--

> Legacy Code(n): Code no one understands and everyone is afraid of changing.

Esp code with:

* No documentation
* Few or no tests
* No remaining engineers that understand the design

---

#### BONUS ROUND!

What would you do if there were no tests in the application?

--

You have to start by writing tests. (Okay. How?)

--

You know where the bad code is. Write as many tests as you can think of.
Each one should build an instance of what you're trying to refactor, send it some data,
and record the response. It doesn't matter why you get that response. Right now,
there aren't tests so _the code is the single source of truth_!

This is almost like you "manually snapshotting" the method like we saw with Sam yesterday.
Finally, you can use "code coverage" tools to be sure you handled all the branches.
