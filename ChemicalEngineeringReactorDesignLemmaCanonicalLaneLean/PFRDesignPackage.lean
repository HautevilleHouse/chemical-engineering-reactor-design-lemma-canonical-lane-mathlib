import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure PFRDesignPackage (R : RateLawPackage) where
  tubeLength : Prop
  tubeDiameter : Prop
  inletConcentration : Prop
  inletFlowRate : Prop
  conversionProfile : Prop
  differentialMassBalance : Prop
  pressureDrop : Prop
  designEquationIntegrated : Prop
  reactorSizing : Prop

structure PFRDesignEvidence {R : RateLawPackage} (P : PFRDesignPackage R) where
  tubeLengthClosed : P.tubeLength
  tubeDiameterClosed : P.tubeDiameter
  inletConcentrationClosed : P.inletConcentration
  inletFlowRateClosed : P.inletFlowRate
  conversionProfileClosed : P.conversionProfile
  differentialMassBalanceClosed : P.differentialMassBalance
  pressureDropClosed : P.pressureDrop
  designEquationIntegratedClosed : P.designEquationIntegrated
  reactorSizingClosed : P.reactorSizing

def PFRDesignPackageClosed {R : RateLawPackage} (P : PFRDesignPackage R) : Prop :=
  P.tubeLength ∧ P.tubeDiameter ∧ P.inletConcentration ∧ P.inletFlowRate ∧
  P.conversionProfile ∧ P.differentialMassBalance ∧ P.pressureDrop ∧
  P.designEquationIntegrated ∧ P.reactorSizing

theorem pfr_design_package_closed_from_evidence {R : RateLawPackage} (P : PFRDesignPackage R) (E : PFRDesignEvidence P) :
    PFRDesignPackageClosed P := by
  exact And.intro E.tubeLengthClosed
    (And.intro E.tubeDiameterClosed
      (And.intro E.inletConcentrationClosed
        (And.intro E.inletFlowRateClosed
          (And.intro E.conversionProfileClosed
            (And.intro E.differentialMassBalanceClosed
              (And.intro E.pressureDropClosed
                (And.intro E.designEquationIntegratedClosed E.reactorSizingClosed)))))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
