# Log Temperature Cookbook

This cookbook will install a temperature logger on a Raspberry Pi running Raspbian Stretch.

Logs will be written to /var/log/temperature/temperature.log.

This includes a config file for logrotate keeping logs of the last 30 days in /var/log/temperature/archive.

## Requirements

### Platforms

- Raspbian

### Chef

- Chef 12+

### Cookbooks

- none

## Attributes

- none

## Templates

- none

## Cookbook Files

- none

## Usage

Nothing to note.

## License & Authors

Copyright 2018, Simon Hardijanto ([simon@hardijanto.de](mailto:simon@hardijanto.de))

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.