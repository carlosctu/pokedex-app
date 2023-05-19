
import 'package:flutter/material.dart';
import 'package:poke_system/poke_system.dart';

class SearchBar extends StatefulWidget {
  final Function(bool value)? onSearchChanged;
  final Function(String? value) onSearch;
  final String? hintText;
  const SearchBar({
    super.key,
    this.onSearchChanged,
    required this.onSearch,
    this.hintText,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  bool isInputEmpty = true;

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    validateTextInput(String? value) {
      setState(() => isInputEmpty = value?.isEmpty ?? true);
    }

    onInputChanged(String? value) {
      validateTextInput(value);
      widget.onSearch.call(value);
    }

    onSearchPressed() {
      widget.onSearch.call(controller.text);
    }

    clearInput() {
      widget.onSearch.call(null);
      controller.clear();
      validateTextInput(null);
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colors.greyScaleGroup.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SearchButton(onPressed: onSearchPressed),
            _InputField(
              onFocusChange: widget.onSearchChanged,
              theme: theme,
              onChange: onInputChanged,
              controller: controller,
              focusNode: focusNode,
              hintText: widget.hintText,
            ),
            _CloseButton(
              isButtonActive: !isInputEmpty,
              onPressed: () => clearInput(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.onFocusChange,
    required this.theme,
    required this.onChange,
    required this.controller,
    required this.focusNode,
    required this.hintText,
  });

  final Function(bool value)? onFocusChange;
  final PokeThemeData theme;
  final Function(String? value) onChange;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          style: theme.typography.b1.copyWith(
            color: theme.colors.greyScaleGroup.dark,
          ),
          onChanged: onChange,
          controller: controller,
          autocorrect: false,
          cursorColor: theme.colors.greyScaleGroup.medium,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintStyle: theme.typography.b1.copyWith(
              color: theme.colors.greyScaleGroup.medium,
            ),
            contentPadding: const EdgeInsets.all(0.0),
            hintText: hintText,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  final bool isButtonActive;
  final Function() onPressed;
  const _CloseButton({
    required this.isButtonActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return Visibility(
      visible: isButtonActive,
      child: IconButton(
        padding: const EdgeInsets.only(
          left: 18,
          right: 12,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconSize: 20,
        icon: Icon(
          Icons.close,
          color: theme.colors.identityGroup.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  final Function() onPressed;
  const _SearchButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = PokeThemeData();

    return IconButton(
      padding: const EdgeInsets.only(
        left: 14,
        right: 10,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: 24,
      icon: Icon(
        Icons.search,
        color: theme.colors.identityGroup.primary,
      ),
      onPressed: onPressed,
    );
  }
}
