# 🧪 ROBOT FRAMEWORK WITH BDD FOR WEB + MOBILE + E2E TESTING (MOBILE & WEB)

> ROBOT FRAMEWORK WITH BDD FOR WEB + MOBILE + E2E TESTING (MOBILE & WEB)

---

## 🚀 Setup Instructions
1 - Install python3

2 - Add Python to PATH, refer to https://realpython.com/add-python-to-path/

3 - Install peotry on MAC, refer to https://docs.robotframework.org/docs/getting_started/testing#managing-dependencies-with-poetry
```bash
curl -sSL https://install.python-poetry.org | python3 -
```

4 - Add Poetry to PATH

5 - Install dependency of project by poetry
```bash
poetry install --no-root
```

6 - Run the following command to init browser
```bash
poetry run rfbrowser init
```

7 - Install Appium

8 - Install Android studio & configure Android studio to Path

9 - Create Android emulator

10 - Install xcode

11 - Create iOS simulator

12 - Install Appium driver: UIAutomator2 and XCUITest

13 - Without error, try to trigger command line to run test at Run Test section

---

## ▶️ Run Tests

### I - Web testing
1 - Update the testing browser at web/resources/config/sit/env_config.robot

2 - Run test on desktop web at poetry shell (Please update the testing browser at web/resources/config/sit/env_config.robot before trigger this command line)

2.1 - If you want to run test on default testing browser(chromium)
```bash
poetry run robot --variable env:SIT --outputdir reports --timestampoutputs web/testcases/web_sample.robot
```

2.2 - If you want to run test on specific testing browser, example: firefox
```bash
poetry run robot --variable env:SIT --variable browser:firefox --outputdir reports --timestampoutputs web/testcases/web_sample.robot
```

3 - Logs and Reports can be accessed by the link on console after execution or at reports/

---

### II - Mobile testing
1 - Start Andorid emulator / iOS simulator which we want to test

2 - Start Appium on terminal / Powershell

3 - Update the information of android emulator and iOS simulator at mobile/resources/config/sit/env_config.robot

4 - Run test on device

4.1 - iOS application at poetry shell (Please update the testing iOS device at mobile/resources/config/sit/env_config.robot before trigger this command line)
```bash
poetry run robot --variable env:SIT --variable platform:iOS --outputdir reports --timestampoutputs mobile/testcases/mobile_sample.robot
```

4.2 - Run test on android application at poetry shell (Please update the testing Android device at mobile/resources/config/sit/env_config.robot before trigger this command line)
```bash
poetry run robot --variable env:SIT --variable platform:Android --outputdir reports --timestampoutputs mobile/testcases/mobile_sample.robot
```

5 - Logs and Reports can be accessed by the link on console after execution or at reports/

---

### III - E2E testing (on both mobile + web)
1 - Start Andorid emulator / iOS simulator which we want to test

2 - Start Appium on terminal / Powershell

3 - Update the information of android emulator and iOS simulator at mobile/resources/config/sit/env_config.robot

4 - Update the testing browser at web/resources/config/sit/env_config.robot

5 - Run e2e test on desktop browser and mobile, example: run test on firefox and android emulator
```bash
poetry run robot --variable env:SIT --variable platform:Android --variable browser:firefox --outputdir reports --timestampoutputs mobile/testcases/mobile_sample.robot
```

6 - Logs and Reports can be accessed by the link on console after execution or at reports/

---
