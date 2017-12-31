var snakeCase = function(string) {

  string = string.replace(/\.\./g, " ");

  (string.indexOf(" ") < 0) ? string = string.replace(/([A-Z])/g, " $1") : null;

  return string
    .trim()
    .toLowerCase()
    .replace(/[,?.]/g, "")
    .replace(/\-/g, " ")
    .split(" ")
    .join("_");
}

module.exports = snakeCase
