## Wprowadzenie
  Solucja składa się z dwóch projektów. TasksManager.Database jest schematem struktury bazy danych zawierającym definicje wszystkich niezbędnych obiektów.
TasksManagerCmd jest projektem zawierającym aplikację konsolową, za pomocą której można automatycznie zainicjalizować bazę danych wraz ze wszystkimi obiektami
oraz wykonywać zainicjalizowane procedury.

Tech stack: Microsoft SQL Server Developer (MSSQL 15), .NET Core 8, C#

## Procedura InsertTestData
  InsertTestData służy do generowania testowych danych wedle wskazań w zadaniu. Oprócz wyszczególnionych rekordów przy insercie do tabeli Tasks
aktywuje się trigger, który wstrzykuje automatycznie rekord przechowujący informacje o inicjalizacji danych w tabeli TasksHistory.

## Jak używać TasksManagerCmd
  Aplikacja konsolowa używa biblioteki CommandLineParser do automatycznego parsowania argumentów, aby można było wywołać komendę za pomocą 
jednej linijki w konsoli. Parametry są potrzebne do prawidłowego połączenia z serwerem i szczegółowego określenia zamiarów użytkownika.

Lista komend:
*DbInitialization - inicjalizacja bazy danych
*DbExec - wykonanie procedury składowanej

Lista parametrów:
*DbInitialization:
  DbName - nazwa bazy danych, którą chcemy zainicjalizować (w przesyłanym jako input stringu piszemy -d nazwa lub --DbName nazwa)
  IsIntegrated - czy używamy logowania zintegrowanego na serwerze (w przesyłanym jako input boolu piszemy -i true_lub_false lub --IsIntegrated true_lub_false)
  AdminLogin - nazwa admina serwera (w inpucie piszemy -l nazwa lub --AdminLogin nazwa)
  AdminPwd - hasło do admina serwera (w inpucie piszemy -p haslo lub --AdminPwd haslo)
