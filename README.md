# 🚀 Superpowers Skills for Hermes Agent

> Адаптированные скиллы из [Superpowers Methodology](https://github.com/superpowers-dev) для [Hermes Agent](https://hermes-agent.nousresearch.com/)
>
> Систематизированный workflow: от идеи → до production-ready кода с контролем качества на каждом этапе.

---

## 📋 Что это

**Superpowers Skills** — набор инструкций (skills) для Hermes Agent, которые превращают хаотичную разработку в предсказуемый процесс. Каждый скилл отвечает за свой этап и содержит конкретные правила, чеклисты и антипаттерны.

**Ключевая идея:** перед тем как писать код — продумать. Перед тем как мержить — проверить. Перед тем как деплоить — убедиться, что ничего не сломано.

---

## 🎯 Быстрый старт

### Установка (1 команда)

```bash
# Автоматическая установка
curl -fsSL https://raw.githubusercontent.com/demoniksem/superpowers-skills/main/install.sh | bash

# Или вручную — клонировать в ~/.hermes/skills/
git clone https://github.com/demoniksem/superpowers-skills.git ~/.hermes/skills/superpowers
```

### Проверка

```bash
# Список установленных скиллов
hermes skills list

# Должны появиться:
# - brainstorming
# - frontend-design
# - executing-plans
# - finishing-a-development-branch
# - receiving-code-review
# - subagent-driven-development
# - taste-skill
```

---

## 📚 Скиллы

### 🔥 Core Workflow (основной пайплайн)

| Скилл | Когда использовать | Что делает |
|-------|-------------------|------------|
| **`brainstorming`** | **ОБЯЗАТЕЛЬНО** перед любой креативной работой | Превращает идею в полноценный дизайн через диалог. Не даёт писать код до утверждения концепции. |
| **`frontend-design`** | После brainstorming, перед написанием плана | Создаёт дизайн систему, выбирает типографику, цвета, layout. Интегрирует taste-skill для премиального UI. |
| **`writing-plans`** | Перед началом разработки | Разбивает задачу на маленькие шаги с конкретными файлами и ожидаемым результатом. |
| **`executing-plans`** | Когда план готов | Выполняет план пошагово, проверяя каждый пункт. |
| **`subagent-driven-development`** | Для сложных задач | Делегирует части работы субагентам, потом собирает результат. |
| **`finishing-a-development-branch`** | Перед мержем / деплоем | Проверяет: тесты, линтер, документация, git clean. Даёт выбор: PR, merge, или продолжить. |
| **`receiving-code-review`** | Когда пришёл feedback | Обрабатывает замечания из code review систематически, не хаотично. |

### 🎨 Taste Skill (дизайн-правила)

Премиальные дизайн-правила из [taste-skill](https://github.com/Leonxlnx/taste-skill) — защита от "AI-slop" интерфейсов.

| Файл | Назначение |
|------|------------|
| `taste-skill/SKILL.md` | **Core rules** — 226 секций: типографика, цвет, layout, motion, 10-section creative arsenal |
| `taste-skill/soft-skill.md` | Awwwards-tier UI — haptic aesthetics, nested architecture, premium feel |
| `taste-skill/minimalist-skill.md` | Editorial / Linear / Notion vibes — чистота и воздух |
| `taste-skill/output-skill.md` | Anti-truncation — защита от обрезки вывода, forces full output |

**Baseline конфигурация:**
- `DESIGN_VARIANCE: 8` (1=идеальная симметрия, 10=творческий хаос)
- `MOTION_INTENSITY: 6` (1=статика, 10=кинематографика)
- `VISUAL_DENSITY: 4` (1=арт-галерея, 10=пилотская кабина)

---

## 🔄 Полный Workflow

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                             SUPERPOWERS PIPELINE                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  💡 Идея                                                                    │
│    │                                                                        │
│    ▼                                                                        │
│  🧠 brainstorming (ОБЯЗАТЕЛЬНО)                                            │
│    │  • Исследовать контекст проекта                                       │
│    │  • Задавать уточняющие вопросы                                        │
│    │  • Представить дизайн → получить approve                              │
│    │                                                                        │
│    ▼                                                                        │
│  🎨 frontend-design (+ taste-skill)                                        │
│    │  • Определить дизайн-систему                                          │
│    │  • Выбрать типографику, цвета, spacing                                │
│    │  • Создать варианты layout                                            │
│    │                                                                        │
│    ▼                                                                        │
│  📝 writing-plans                                                          │
│    │  • Разбить на маленькие задачи                                        │
│    │  • Определить файлы и ожидаемый результат                             │
│    │                                                                        │
│    ▼                                                                        │
│  ⚙️  executing-plans ИЛИ subagent-driven-development                       │
│    │  • Выполнять пошагово                                                 │
│    │  • Проверять каждый пункт                                             │
│    │                                                                        │
│    ▼                                                                        │
│  ✅ finishing-a-development-branch                                         │
│    │  • Тесты проходят?                                                    │
│    │  • Линтер чист?                                                       │
│    │  • Документация обновлена?                                            │
│    │  → PR / Merge / Continue                                              │
│    │                                                                        │
│    ▼                                                                        │
│  👀 receiving-code-review (если есть feedback)                             │
│       • Обработать замечания систематически                                │
│       • Не ломать соседний код                                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## ⚡ Когда какой скилл НЕ нужен

**Не используй `brainstorming` для:**
- Инфраструктурных скриптов и конфигов
- One-off дашбордов
- Debug утилит
- Исследовательских задач (research, анализ данных)
- Багфиксов
- DevOps задач

**Для всего этого — просто делай и кратко объясняй, если спросят.**

---

## 🛠️ Структура репозитория

```
superpowers-skills/
├── brainstorming/                    # Обязательный первый шаг
│   ├── SKILL.md                      # 106 строк правил
│   └── references/                   # Дополнительные материалы
├── frontend-design/                  # Дизайн система
│   └── SKILL.md                      # 273 строки
├── writing-plans/                    # Планирование
│   └── SKILL.md                      # (внешний скилл)
├── executing-plans/                  # Выполнение
│   └── SKILL.md                      # 64 строки
├── subagent-driven-development/      # Делегирование
│   └── SKILL.md                      # 138 строк
├── finishing-a-development-branch/   # Завершение
│   └── SKILL.md                      # 122 строки
├── receiving-code-review/            # Code review
│   └── SKILL.md                      # 91 строка
├── taste-skill/                      # Дизайн-правила
│   ├── SKILL.md                      # 226 строк (core)
│   ├── soft-skill.md                 # Premium UI
│   ├── minimalist-skill.md           # Minimal/editorial
│   └── output-skill.md               # Anti-truncation
├── install.sh                        # Автоустановка
├── LICENSE                           # MIT
└── README.md                         # Этот файл
```

---

## 🤝 Совместимость

- **Hermes Agent** — primary target, тестировано
- **Другие агенты** — скопируйте `SKILL.md` в `~/.hermes/skills/<skill-name>/`

---

## 📝 Лицензия

MIT — используй свободно, форкай, улучшай.

**PR welcome!** Если есть идеи по улучшению скиллов — кидай PR.
