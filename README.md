## users
| Column            | Type             | Option                                |
|-------------------|------------------|---------------------------------------|
| email             | string           | null: false                           |
| password          | string           | null: false                           |
| name              | string           | null: false                           |
| profile           | text             | null: false                           |
| occupation        | text             | null: false                           |
| position          | text             | null: false                           |

### Association
has_many: prototypes
has_many: comments

## prototypes

| Column            | Type             | Option                                |
|-------------------|------------------|---------------------------------------|
| title             | string           | null: false                           |
| catch_copy        | text             | null: false                           |
| concept           | text             | null: false                           |
| user              | references       | null: false, foreign_key: true        |

### Association
belongs_to: user
has_many: comments

## comments

| Column            | Type             | Option                                |
|-------------------|------------------|---------------------------------------|
| test              | text             | nill: false                           |
| user              | references       | foreign_key: true                     |
| prototypes        | references       | null: false, foreign_key: true        |

### Association
belongs_to: user
belongs_to: prototype
