extension MyIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension DoubleFix on double {
  //字符转换成Color对象
  String toStringAsRoundDown(int postion) {
    if ((this.toString().length - this.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return (this
          .toStringAsFixed(postion)
          .substring(0, this.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return (this
          .toString()
          .substring(0, this.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }
}
