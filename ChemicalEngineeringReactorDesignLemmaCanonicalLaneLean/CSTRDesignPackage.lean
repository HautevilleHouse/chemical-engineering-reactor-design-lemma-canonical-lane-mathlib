import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure CSTRDesignPackage (R : RateLawPackage) where
  volume : Prop
  feedConcentration : Prop
  feedFlowRate : Prop
  conversion : Prop
  steadyStateMassBalance : Prop
  energyBalance : Prop
  heatTransfer : Prop
  designEquation : Prop
  reactorSizing : Prop

structure CSTRDesignEvidence {R : RateLawPackage} (C : CSTRDesignPackage R) where
  volumeClosed : C.volume
  feedConcentrationClosed : C.feedConcentration
  feedFlowRateClosed : C.feedFlowRate
  conversionClosed : C.conversion
  steadyStateMassBalanceClosed : C.steadyStateMassBalance
  energyBalanceClosed : C.energyBalance
  heatTransferClosed : C.heatTransfer
  designEquationClosed : C.designEquation
  reactorSizingClosed : C.reactorSizing

def CSTRDesignPackageClosed {R : RateLawPackage} (C : CSTRDesignPackage R) : Prop :=
  C.volume ∧ C.feedConcentration ∧ C.feedFlowRate ∧ C.conversion ∧
  C.steadyStateMassBalance ∧ C.energyBalance ∧ C.heatTransfer ∧
  C.designEquation ∧ C.reactorSizing

theorem cstr_design_package_closed_from_evidence {R : RateLawPackage} (C : CSTRDesignPackage R) (E : CSTRDesignEvidence C) :
    CSTRDesignPackageClosed C := by
  exact And.intro E.volumeClosed
    (And.intro E.feedConcentrationClosed
      (And.intro E.feedFlowRateClosed
        (And.intro E.conversionClosed
          (And.intro E.steadyStateMassBalanceClosed
            (And.intro E.energyBalanceClosed
              (And.intro E.heatTransferClosed
                (And.intro E.designEquationClosed E.reactorSizingClosed)))))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
