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

### Superpowers Workflow
| Скилл | Назначение |
|-------|------------|
| `brainstorming` | **MANDATORY** перед любой креативной работой |
| `frontend-design` | Дизайн фронтенда после brainstorming |
| `writing-plans` | Написание плана реализации |
| `executing-plans` | Выполнение написанного плана |
| `subagent-driven-development` | Выполнение через субагентов |
| `finishing-a-development-branch` | Завершение работы с выбором стратегии |
| `receiving-code-review` | Обработка feedback от code review |

### Taste Skill (Design Rules)
Премиальные дизайн-правила из [taste-skill](https://github.com/Leonxlnx/taste-skill) — анти-паттерны, типографика, motion, layout variance.

| Файл | Назначение |
|------|------------|
| `taste-skill/SKILL.md` | Core design rules (226 секций: typography, color, layout, 10-section creative arsenal) |
| `taste-skill/soft-skill.md` | Awwwards-tier UI — haptic aesthetics, nested architecture |
| `taste-skill/minimalist-skill.md` | Editorial/Linear/Notion vibes |
| `taste-skill/output-skill.md` | Anti-truncation — forces full output |

## Workflow

```
Idea → brainstorming (MANDATORY) → frontend-design (+ taste-skill) → writing-plans → executing-plans → finishing-a-development-branch
```

## Для других агентов

Эти скиллы совместимы с Hermes Agent. Скопируйте нужные в `~/.hermes/skills/<skill-name>/SKILL.md`.

Если хотите внести улучшения — PRs welcome.
