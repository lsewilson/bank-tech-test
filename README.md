# Bank Tech Test

This is my solution to the following tech test specification:

> Requirements

> * You should be able to interact with the your code via IRB. (You don't need to implement a command line interface that takes input from STDIN.)
> * Deposits, withdrawal.
> * Account statement (date, amount, balance) printing.
> * Data can be kept in memory (it doesn't need to be stored to a database or anything).
> * Acceptance criteria

> Given a client makes a deposit of 1000 on 10-01-2012 and a deposit of 2000 on 13-01-2012 and a withdrawal of 500 on 14-01-2012 when she prints her bank statement then she would see

>```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Installation

### Set up
```
$ git clone git@github.com:lsewilson/bank-tech-test.git
$ cd bank-tech-test
$ bundle
```

### Run tests
```
$ rspec
```

## How to Use in IRB (Feature Test)

```
[15:16:39] bank-tech-test > irb
2.3.1 :001 > require './lib/account.rb'
 => true
2.3.1 :002 > account = Account.new
 => #<Account:0x007fed7ba3fcd0 @transaction_class=Transaction, @transactions=[]>
2.3.1 :003 > account.deposit(1000, Time.new(2012,01,10))
 => [#<Transaction:0x007fed7ba1eb70 @type=:credit, @time=2012-01-10 00:00:00 +0000, @amount=1000>]
2.3.1 :004 > account.deposit(2000, Time.new(2012,01,13))
 => [#<Transaction:0x007fed7ba1eb70 @type=:credit, @time=2012-01-10 00:00:00 +0000, @amount=1000>, #<Transaction:0x007fed7ba14120 @type=:credit, @time=2012-01-13 00:00:00 +0000, @amount=2000>]
2.3.1 :005 > account.withdraw(500, Time.new(2012,01,14))
 => [#<Transaction:0x007fed7ba1eb70 @type=:credit, @time=2012-01-10 00:00:00 +0000, @amount=1000>, #<Transaction:0x007fed7ba14120 @type=:credit, @time=2012-01-13 00:00:00 +0000, @amount=2000>, #<Transaction:0x007fed7ba04568 @type=:debit, @time=2012-01-14 00:00:00 +0000, @amount=500>]
2.3.1 :006 > account.print_statement
date || credit || debit || balance
14/01/2012 || || 500 || 2500
13/01/2012 || 2000 || || 3000
10/01/2012 || 1000 || || 1000
 => ["14/01/2012 || || 500 || 2500", "13/01/2012 || 2000 || || 3000", "10/01/2012 || 1000 || || 1000"]
```

## Approach to Problem

I started by creating transaction classes for debit and credit transactions which were responsible for understanding the properties of a transaction. These were later refactored to a single Transaction class, which had an additional 'type' property.

Then I made the Account class which was responsible for creating and storing transactions.  

Finally, I created a Statement class which was responsible for rendering the statement as specified in the brief.

I would have liked to create a TransactionHistory class which is responsible for storing transactions, so that the Account class is only responsible for instantiating a transaction.
