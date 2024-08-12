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
Aplikację odpalamy przez windowsowy wiersz polecenia.

Lista komend:
*DbInitialization - inicjalizacja bazy danych
*DbExec - wykonanie procedury składowanej

### Komendy i parametry

Lista parametrów:

*DbInitialization:
  DbName - nazwa bazy danych, którą chcemy zainicjalizować (w przesyłanym jako input stringu piszemy -d nazwa lub --DbName nazwa)
  IsIntegrated - czy używamy logowania zintegrowanego na serwerze (w przesyłanym jako input boolu piszemy -i true_lub_false lub --IsIntegrated true_lub_false)
  AdminLogin - nazwa admina serwera (w inpucie piszemy -l nazwa lub --AdminLogin nazwa)
  AdminPwd - hasło do admina serwera (w inpucie piszemy -p haslo lub --AdminPwd haslo)
  ServerName - nazwa serwera (w inpucie piszemy -n nazwa lub --ServerName nazwa)
  
*DbExec
  Zawiera wszystkie parametry, które zawiera komenda DbInitialization (oczywiście jako DbName podajemy istniejącą bazę danych zainicjalizowaną wcześniej przez programn)
  ProcName - nazwa procedury, którą chcemy wykonać (w inpucie piszemy -c nazwa lub --ProcName nazwa)
  ProcParams - parametry podane po przecinku w kolejności występowania (stringa przekazujemy w ciapkach) w inpucie piszemy -a parametry lub --ProcParams parametry

### Przykłady wywołania aplikacji

1. Gdy chcemy wywołać komendę DbInitialization:
   C:\TasksManager\TasksManager\TasksManagerCmd\bin\Debug\net8.0\TasksManagerCmd.exe DbInitialization -i true -l admin -p Qwerty123 -n localhost -d test

2. Gdy chcemy wywołać komendę DbExec:
   C:\TasksManager\TasksManager\TasksManagerCmd\bin\Debug\net8.0\TasksManagerCmd.exe DbExec -i true -l admin -p Qwerty123 -n localhost -d test -c InsertTestData

### Lista dostępnych procedur

AddTask - dodaje zadanie, parametry: 
	@Name NVARCHAR(200) NULL,
	@Description NVARCHAR(MAX) NULL,
	@Owner UNIQUEIDENTIFIER NULL,
	@Shared BIT NULL,
	@Priority INT NULL,
	@StoryPointsEstimation INT NULL

 DeleteTask - usuwa zadanie, parametry:
	@Id UNIQUEIDENTIFIER NULL,
	@TaskId INT NULL

 EditTask - edytuje zadanie, parametry:
 	@Id INT NULL,
	@TaskId INT NULL,
	@NewTaskName NVARCHAR(200) NULL,
	@NewTaskDescription NVARCHAR(MAX) NULL,
	@NewOwner UNIQUEIDENTIFIER NULL,
	@NewShared BIT NULL,
	@NewPriority INT NULL,
	@NewStoryPointsEstimation INT NULL

 InsertTestData - wstawia do tabel testowe dane (100 testowych userów dla 10 podmiotów oraz 1000 zadań dla każdego użytkownika), nie posiada parametrów
