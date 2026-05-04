---
description: "Java（Spring Boot）のベストプラクティスに沿ったコードを書く"
---

Java（Spring Boot）のベストプラクティスに従ってコードを書く。

1. 命名規則を守る。クラスは `PascalCase`、メソッド・変数は `camelCase`、定数は `SCREAMING_SNAKE_CASE`
2. `final` を積極的に使い、不必要な再代入を防ぐ
3. インターフェースに依存し、具象クラスに直接依存しない（依存性逆転の原則）
4. コンストラクタインジェクションを使用する。`@Autowired` によるフィールドインジェクションは避ける
5. `@Controller` / `@Service` / `@Repository` を適切に分離し、レイヤードアーキテクチャを維持する
6. `Optional` を使い、null の返却・受け取りを避ける
7. Lombok を使う場合は `@Data` より `@Getter` / `@Setter` / `@Builder` を個別に指定し、意図を明示する
8. `catch (Exception e)` の乱用を避け、想定される例外を適切な粒度で捕捉する
