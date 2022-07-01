export const toRp = (angka) => {
  let numbers = 0;
  if (angka === null) return 0;
  else if (angka === 0) return 0;
  else if (parseInt(angka) === 0) return 0;
  if (parseFloat(angka) < 0) {
    numbers = angka.toString().replace("-", "");
  } else {
    numbers = angka;
  }
  var number_string =
      numbers === "" || numbers === undefined
        ? String(0.0)
        : numbers.toString().replace(/,|\D/g, ""),
    split = number_string.split("."),
    sisa = split[0].length % 3,
    rupiah = split[0].substr(0, sisa),
    ribuan = split[0].substr(sisa).match(/\d{3}/gi);

  // tambahkan koma jika yang di input sudah menjadi angka ribuan
  if (ribuan) {
    var separator = sisa ? "," : "";
    rupiah += separator + ribuan.join(",");
  }

  rupiah = split[1] !== undefined ? rupiah + "," + split[1] : rupiah;
  rupiah =
    parseFloat(angka) < 0
      ? "-" + rupiah.replace(/^0+/, "")
      : rupiah.replace(/^0+/, "");
  return rupiah;
};

export const rmComma = (angka) => {
  return angka.replaceAll(",", "");
};

export const getUniqueListBy = (arr, key) => {
  return [...new Map(arr.map((item) => [item[key], item])).values()];
};

export const toInt = (val) => {
  return parseInt(val, 10);
};
