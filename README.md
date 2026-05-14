# Superpowers Skills for Hermes Agent

Адаптированные скиллы из Superpowers methodology для Hermes Agent.

## Установка

```bash
# Клонировать в ~/.hermes/skills/
git clone https://github.com/demoniksem/superpowers-skills.git ~/.hermes/skills/superpowers

# Или использовать install.sh
curl -fsSL https://raw.githubusercontent.com/demoniksem/superpowers-skills/main/install.sh | bash
```

## Скиллы

| Скилл | Назначение |
|-------|------------|
| `brainstorming` | **MANDATORY** перед любой креативной работой |
| `frontend-design` | Дизайн фронтенда после brainstorming |
| `writing-plans` | Написание плана реализации |
| `executing-plans` | Выполнение написанного плана |
| `subagent-driven-development` | Выполнение через субагентов |
| `finishing-a-development-branch` | Завершение работы с выбором стратегии |
| `receiving-code-review` | Обработка feedback от code review |

## Workflow

```
Idea → brainstorming (MANDATORY) → frontend-design → writing-plans → executing-plans → finishing-a-development-branch
```

## Для других агентов

Эти скиллы совместимы с Hermes Agent. Скопируйте нужные в `~/.hermes/skills/<skill-name>/SKILL.md`.

Если хотите внести улучшения — PRs welcome.
