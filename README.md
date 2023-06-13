# Replace Values Action

<!-- markdownlint-disable MD013 -->
[![Action test on Ubuntu](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/ubuntu_action_test.yml/badge.svg)](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/ubuntu_action_test.yml) [![Action test on MacOS](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/macos_action_test.yml/badge.svg)](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/macos_action_test.yml) [![Action test on Windows](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/windows_action_test.yml/badge.svg)](https://github.com/GuillaumeFalourd/replace-values-action/actions/workflows/windows_action_test.yml)
<!-- markdownlint-enable MD013 -->

☞ GitHub Action to replace values in a specific file :octocat:

## 📚 Usage

### Simple value

```yaml
- name: Replace simple value in a specific file
  uses: GuillaumeFalourd/replace-values-action@v1
  with:
    file_path: ./path/to/file
    current_value: old_value
    new_value: new_value
```

### Multiline values

```yaml
- name: Replace multiple values in a specific file
  uses: GuillaumeFalourd/replace-values-action@v1
  with:
    file_path: ./path/to/file
    current_value: |
       first_key
       second_key
    new_value: |
       first_value
       second_value
```

## ▶️ Action Inputs

Field | Mandatory | Observation
------------ | ------------  | -------------
**file_path** | YES | Path to the file to update.
**current_value** | YES | Value(s) to replace.
**new_value** | YES | New value(s) to set in the informed file, in the same order.

## 🤝 Contributing

☞ If you're interested in contributing to this repository, please follow the [guidelines](https://github.com/GuillaumeFalourd/replace-values-action/blob/main/CONTRIBUTING.md)

## 🏅 Licensed

☞ This repository uses the [Apache License 2.0](https://github.com/GuillaumeFalourd/replace-values-action/blob/main/LICENSE)

<!-- ### Contribuidores

<a href="https://github.com/GuillaumeFalourd/replace-values-action/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=GuillaumeFalourd/replace-values-action" />
</a>

(Criado com [contributors-img](https://contrib.rocks)) -->
