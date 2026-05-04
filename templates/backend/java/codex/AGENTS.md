# Java（Spring Boot）ベストプラクティス

Java（Spring Boot）のベストプラクティスに従ってコードを書く。

## 命名規則

- クラス: `PascalCase`
- メソッド・変数: `camelCase`
- 定数: `SCREAMING_SNAKE_CASE`

## 不変性

`final` を積極的に使い、不必要な再代入を防ぐ。

```java
// Good
final String name = "example";

// Bad
String name = "example";
name = "other"; // 再代入が発生するならOK、発生しないなら final にする
```

## 依存性逆転

インターフェースに依存し、具象クラスに直接依存しない。

```java
// Good
private final UserRepository userRepository;

// Bad
private final UserRepositoryImpl userRepository;
```

## インジェクション

コンストラクタインジェクションを使用する。`@Autowired` によるフィールドインジェクションは避ける。

```java
// Good
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
}

// Bad
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
}
```

## レイヤードアーキテクチャ

`@Controller` / `@Service` / `@Repository` を適切に分離する。

- `@Controller`: HTTP リクエストの受付・レスポンスの返却のみ
- `@Service`: ビジネスロジック
- `@Repository`: データアクセス

## null 回避

`Optional` を使い、null の返却・受け取りを避ける。

```java
// Good
public Optional<User> findById(Long id) {
    return userRepository.findById(id);
}

// Bad
public User findById(Long id) {
    return userRepository.findById(id).orElse(null);
}
```

## Lombok

`@Data` より `@Getter` / `@Setter` / `@Builder` を個別に指定し、意図を明示する。

```java
// Good
@Getter
@Builder
public class UserDto {
    private final Long id;
    private final String name;
}

// Bad
@Data
public class UserDto {
    private Long id;
    private String name;
}
```

## 例外処理

`catch (Exception e)` の乱用を避け、想定される例外を適切な粒度で捕捉する。

```java
// Good
try {
    userRepository.save(user);
} catch (DataIntegrityViolationException e) {
    throw new UserAlreadyExistsException(user.getEmail());
}

// Bad
try {
    userRepository.save(user);
} catch (Exception e) {
    e.printStackTrace();
}
```
