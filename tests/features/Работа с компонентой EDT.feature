# language: ru

Функционал: Создание проекта
    Как разработчик
    Я хочу быстро конвертировать конфигурации
    Чтобы не тратить время на рутинные операции

Контекст:
    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    # И Я создаю каталог "fixtures/1C" в рабочем каталоге
    # И Я создаю каталог "fixtures/ERT" в рабочем каталоге
    И Я копирую каталог "fixtures" из каталога "tests" проекта в рабочий каталог
    И Я создаю каталог "fixtures/WS_ERT" в рабочем каталоге
    И Я создаю каталог "fixtures/1С_new" в рабочем каталоге
    И Я установил рабочий каталог как текущий каталог
    И Я сохраняю каталог проекта в контекст
    Тогда Я показываю каталог проекта
    И Я показываю рабочий каталог

Сценарий: Импорт Экспорт проекта EDT
    
    Допустим Есть каталог с исходниками по пути "<КаталогПроекта>"
    И в каталог "<КаталогПроекта>/tests/EDT" пустой
    # Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/vanessa-ring.os edt help"
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/vanessa-ring.os edt workspace import --version 8.3.12.1595 --configurationFiles <РабочийКаталог>/fixtures/1C --project <РабочийКаталог>/fixtures/EDT --workspaceLocation <РабочийКаталог>/fixtures/WS_ERT"
    Я сообщаю вывод команды "oscript"
    И Код возврата команды "oscript" равен 0
    
    Тогда Файл "<РабочийКаталог>/fixtures/EDT/.project" существует

    Допустим Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/src/vanessa-ring.os edt workspace export --version 8.3.12.1595 --configurationFiles <РабочийКаталог>/fixtures/1С_new --project <РабочийКаталог>/fixtures/EDT --workspaceLocation <РабочийКаталог>/fixtures/WS_ERT"
    И Код возврата команды "oscript" равен 0
    Тогда Файл "<РабочийКаталог>/fixtures/1С_new/Configuration.xml" существует