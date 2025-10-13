class InsufficientBalanceException implements Exception {
  final String message;
  InsufficientBalanceException(this.message);
  @override
  String toString() => message;
}

class DuplicateAccountException implements Exception {
  final String message;
  DuplicateAccountException(this.message);
  @override
  String toString() => message;
}

class BankAccount {
    // TODO
  final int accountId;
  final String owner;
  double _balance = 0;

  BankAccount(this.accountId, this.owner);

  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) return;
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) return;
    if (_balance - amount < 0) {
      throw InsufficientBalanceException("Insufficient balance for withdrawal!");
    }
    _balance -= amount;
  }

  @override
  String toString() => 'Account $accountId ($owner) - Balance: \$$_balance';
}

class Bank {
    // TODO
  final String name;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.name});

  BankAccount createAccount(int accountId, String owner) {
    if (_accounts.containsKey(accountId)) {
      throw DuplicateAccountException("Account with ID $accountId already exists!");
    }
    final account = BankAccount(accountId, owner);
    _accounts[accountId] = account;
    return account;
  }

  BankAccount? getAccount(int accountId) => _accounts[accountId];
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
