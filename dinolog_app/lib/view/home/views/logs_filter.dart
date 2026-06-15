import 'package:dinolog_app/view/theme.dart';
import 'package:flutter/material.dart';

class LogsFilter extends StatefulWidget {
  final void Function(String? status) onStatusFilterChanged;
  final void Function(String? method) onMethodFilterChanged;

  const LogsFilter({
    super.key,
    required this.onStatusFilterChanged,
    required this.onMethodFilterChanged,
  });

  @override
  State<LogsFilter> createState() => _LogsFilterState();
}

class _LogsFilterState extends State<LogsFilter> {
  String _selectedStatus = 'ALL';
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...['ALL', '2xx', '3xx', '4xx', '5xx'].map((status) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedStatus = status;
                  widget.onStatusFilterChanged(status == 'ALL' ? null : status);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedStatus == status
                    ? DinologTheme.accentSuccess.withAlpha(50)
                    : Colors.transparent,
                foregroundColor: _selectedStatus == status
                    ? DinologTheme.textLabel
                    : Theme.of(context).colorScheme.onSurface,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    color: _selectedStatus == status
                        ? DinologTheme.accentSuccess
                        : Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Text(
                status,
                style: _selectedStatus == status
                    ? Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: DinologTheme.textTitle,
                        fontWeight: FontWeight.w600,
                      )
                    : Theme.of(context).textTheme.labelSmall,
              ),
            ),
          );
        }),
        Text(' | ', style: Theme.of(context).textTheme.labelLarge),
        ...['GET', 'POST', 'PUT', 'DELETE'].map((method) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedMethod == method) {
                  setState(() {
                    _selectedMethod = null;
                    widget.onMethodFilterChanged(null);
                  });
                } else {
                  setState(() {
                    _selectedMethod = method;
                    widget.onMethodFilterChanged(method);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMethod == method
                    ? DinologTheme.accentSuccess.withAlpha(50)
                    : Colors.transparent,
                foregroundColor: _selectedMethod == method
                    ? DinologTheme.textLabel
                    : Theme.of(context).colorScheme.onSurface,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(
                    color: _selectedMethod == method
                        ? DinologTheme.accentSuccess
                        : Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Text(
                method,
                style: _selectedMethod == method
                    ? Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: DinologTheme.textTitle,
                        fontWeight: FontWeight.w600,
                      )
                    : Theme.of(context).textTheme.labelSmall,
              ),
            ),
          );
        }),
      ],
    );
  }
}
