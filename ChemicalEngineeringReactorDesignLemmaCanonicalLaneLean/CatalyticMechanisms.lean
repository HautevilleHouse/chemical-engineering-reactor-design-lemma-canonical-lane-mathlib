import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure CatalyticMechanism where
  adsorptionStep : Prop
  surfaceReactionStep : Prop
  desorptionStep : Prop
  rateDeterminingStep : Prop
  langmuirHinshelwoodExpression : Prop
  adsorptionStepTerm : adsorptionStep
  surfaceReactionStepTerm : surfaceReactionStep
  desorptionStepTerm : desorptionStep
  rateDeterminingStepTerm : rateDeterminingStep
  langmuirHinshelwoodExpressionTerm : langmuirHinshelwoodExpression

structure CatalyticMechanismEvidence (C : CatalyticMechanism) where
  adsorptionStepClosed : C.adsorptionStep
  surfaceReactionStepClosed : C.surfaceReactionStep
  desorptionStepClosed : C.desorptionStep
  rateDeterminingStepClosed : C.rateDeterminingStep
  langmuirHinshelwoodExpressionClosed : C.langmuirHinshelwoodExpression

def CatalyticMechanismClosed (C : CatalyticMechanism) : Prop :=
  C.adsorptionStep ∧ C.surfaceReactionStep ∧ C.desorptionStep ∧
  C.rateDeterminingStep ∧ C.langmuirHinshelwoodExpression

theorem catalytic_mechanism_closed_from_evidence (C : CatalyticMechanism)
    (E : CatalyticMechanismEvidence C) : CatalyticMechanismClosed C := by
  exact And.intro E.adsorptionStepClosed
    (And.intro E.surfaceReactionStepClosed
      (And.intro E.desorptionStepClosed
        (And.intro E.rateDeterminingStepClosed E.langmuirHinshelwoodExpressionClosed)))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
