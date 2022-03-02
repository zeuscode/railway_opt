import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ManTarInputPage extends HookWidget {
  const ManTarInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    final email = useState("");
    final password = useState("");

    _handleSubmit() {}

    return Scaffold(
      appBar: AppBar(
        title: const Text("手动激活"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 52,
                child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "请输入令牌号",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onSaved: (value) => email.value = value!),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 52,
                child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "请输入激活密码",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onSaved: (value) => email.value = value!),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 52,
                child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "请输入激活码",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onSaved: (value) => email.value = value!),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 52.0,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('重置'),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('确定'),
                      ),
                    ),
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
