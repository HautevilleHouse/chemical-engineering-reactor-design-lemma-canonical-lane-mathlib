import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure RateLawPackage where
  forwardRateConstant : Prop
  reverseRateConstant : Prop
  reactionOrder : Prop
  activationEnergy : Prop
  temperatureDependence : Prop
  rateExpression : Prop
  equilibriumConstant : Prop
  rateExpressionDerived : Prop

structure RateLawEvidence (R : RateLawPackage) where
  forwardRateConstantClosed : R.forwardRateConstant
  reverseRateConstantClosed : R.reverseRateConstant
  reactionOrderClosed : R.reactionOrder
  activationEnergyClosed : R.activationEnergy
  temperatureDependenceClosed : R.temperatureDependence
  rateExpressionClosed : R.rateExpression
  equilibriumConstantClosed : R.equilibriumConstant
  rateExpressionDerivedClosed : R.rateExpressionDerived

def RateLawPackageClosed (R : RateLawPackage) : Prop :=
  R.forwardRateConstant ∧ R.reverseRateConstant ∧ R.reactionOrder ∧
  R.activationEnergy ∧ R.temperatureDependence ∧ R.rateExpression ∧
  R.equilibriumConstant ∧ R.rateExpressionDerived

theorem rate_law_package_closed_from_evidence (R : RateLawPackage) (E : RateLawEvidence R) :
    RateLawPackageClosed R := by
  exact And.intro E.forwardRateConstantClosed
    (And.intro E.reverseRateConstantClosed
      (And.intro E.reactionOrderClosed
        (And.intro E.activationEnergyClosed
          (And.intro E.temperatureDependenceClosed
            (And.intro E.rateExpressionClosed
              (And.intro E.equilibriumConstantClosed E.rateExpressionDerivedClosed))))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
