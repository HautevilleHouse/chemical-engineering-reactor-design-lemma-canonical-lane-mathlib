import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactionKineticsPackage where
  temperature : ℝ
  pressure : ℝ
  rateConstant : ℝ
  activationEnergy : ℝ
  preExponentialFactor : ℝ
  reactionOrder : ℕ
  rateExpression : ℝ

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  temperatureClosed : R.temperature > 0
  pressureClosed : R.pressure > 0
  rateConstantClosed : R.rateConstant > 0
  activationEnergyClosed : R.activationEnergy > 0
  preExponentialFactorClosed : R.preExponentialFactor > 0
  reactionOrderClosed : R.reactionOrder ≥ 1
  rateExpressionClosed : R.rateExpression ≥ 0

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.temperature > 0 ∧ R.pressure > 0 ∧ R.rateConstant > 0 ∧
  R.activationEnergy > 0 ∧ R.preExponentialFactor > 0 ∧
  R.reactionOrder ≥ 1 ∧ R.rateExpression ≥ 0

theorem reaction_kinetics_closed_from_evidence
    (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.temperatureClosed
    (And.intro E.pressureClosed
      (And.intro E.rateConstantClosed
        (And.intro E.activationEnergyClosed
          (And.intro E.preExponentialFactorClosed
            (And.intro E.reactionOrderClosed E.rateExpressionClosed)))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse