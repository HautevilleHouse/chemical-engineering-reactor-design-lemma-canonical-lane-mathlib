import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactorDesignEquation where
  materialBalance : Prop
  energyBalance : Prop
  pressureDrop : Prop
  idealReactorAssumption : Prop
  designEquationDerived : Prop
  materialBalanceTerm : materialBalance
  energyBalanceTerm : energyBalance
  pressureDropTerm : pressureDrop
  idealReactorAssumptionTerm : idealReactorAssumption
  designEquationDerivedTerm : designEquationDerived

structure ReactorDesignEquationEvidence (R : ReactorDesignEquation) where
  materialBalanceClosed : R.materialBalance
  energyBalanceClosed : R.energyBalance
  pressureDropClosed : R.pressureDrop
  idealReactorAssumptionClosed : R.idealReactorAssumption
  designEquationDerivedClosed : R.designEquationDerived

def ReactorDesignEquationClosed (R : ReactorDesignEquation) : Prop :=
  R.materialBalance ∧ R.energyBalance ∧ R.pressureDrop ∧
  R.idealReactorAssumption ∧ R.designEquationDerived

theorem reactor_design_equation_closed_from_evidence (R : ReactorDesignEquation)
    (E : ReactorDesignEquationEvidence R) : ReactorDesignEquationClosed R := by
  exact And.intro E.materialBalanceClosed
    (And.intro E.energyBalanceClosed
      (And.intro E.pressureDropClosed
        (And.intro E.idealReactorAssumptionClosed E.designEquationDerivedClosed)))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
