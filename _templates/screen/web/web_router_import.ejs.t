---
inject: true
to: lib/router/web_router.dart
after: // imports
skip_if: import 'package:leaf_for_business/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';
---
import 'package:leaf_for_business/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';