def define_targets(rules):
    rules.py_library(
        name = "torchgen",
        srcs = rules.glob(["**/*.py"]),
        visibility = ["//visibility:public"],
        deps = [
            "@//pip/pyyaml",
            "@//pip/typing_extensions",
        ],
    )

    rules.py_binary(
        name = "gen",
        main = "gen.py",
        srcs = ["gen.py"],
        visibility = ["//visibility:public"],
        deps = [
            ":torchgen",
            "@//pip/pyyaml",
            "@//pip/typing_extensions",
        ],
    )

    rules.py_binary(
        name = "gen_executorch",
        main = "gen_executorch.py",
        srcs = ["gen_executorch.py"],
        visibility = ["//visibility:public"],
        deps = [
            ":torchgen",
            "@//pip/pyyaml",
            "@//pip/typing_extensions",
        ],
    )
