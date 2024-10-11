
class MathOperations {
  double suma(double num1, double num2) => num1 + num2;
  double resta(double num1, double num2) => num1 - num2;
  double multiplicacion(double num1, double num2) => num1 * num2;
  double division(double num1, double num2) {
    if (num2 == 0) {
      throw Exception("No se puede dividir por cero");
    }
    return num1 / num2;
  }
}
