class TaxCalculatorProvider {
  static Map<String, double> calculateTax(
    double totalValue,
    double aliquotaPis,
    double aliquotaCofins,
    double aliquotaIcms,
    double aliquotaIpi,
  ) {
    // Calculando valor do IPI
    var ipiValue = totalValue * (aliquotaIpi / 100);

    // Base de cálculo = total + valor IPI
    var calcBasis = totalValue + ipiValue;

    // Valor do ICMS = base de cálculo * alíquota ICMS
    var icmsValue = calcBasis * (aliquotaIcms / 100);

    // Valor do PIS / COFINS = (base de cálculo - ICMS) * alíquota PIS / COFINS
    var pisValue = (calcBasis - icmsValue) * (aliquotaPis / 100);

    var cofinsValue = (calcBasis - icmsValue) * (aliquotaCofins / 100);

    return {
      'calcBasis': calcBasis,
      'ipiValue': ipiValue,
      'icmsValue': icmsValue,
      'pisValue': pisValue,
      'cofinsValue': cofinsValue,
    };
  }
}
