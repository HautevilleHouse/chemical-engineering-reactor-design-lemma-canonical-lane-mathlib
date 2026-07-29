import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.MassEnergyBalances

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure ReactorDesignEquationPackage where
  designEquation : Prop
  conversionProfile : Prop
  residenceTime : Prop
  reactorVolume : Prop
  optimalConditions : Prop
  catalystActivity : Prop
  deactivationModel : Prop

structure ReactorDesignEquationEvidence (D : ReactorDesignEquationPackage) where
  designEquationClosed : D.designEquation
  conversionProfileClosed : D.conversionProfile
  residenceTimeClosed : D.residenceTime
  reactorVolumeClosed : D.reactorVolume
  optimalConditionsClosed : D.optimalConditions
  catalystActivityClosed : D.catalystActivity
  deactivationModelClosed : D.deactivationModel

def ReactorDesignEquationClosed (D : ReactorDesignEquationPackage) : Prop :=
  D.designEquation ∧ D.conversionProfile ∧ D.residenceTime ∧
  D.reactorVolume ∧ D.optimalConditions ∧ D.catalystActivity ∧ D.deactivationModel

theorem reactor_design_equation_closed_from_evidence
    (D : ReactorDesignEquationPackage) (E : ReactorDesignEquationEvidence D) :
    ReactorDesignEquationClosed D := by
  exact And.intro E.designEquationClosed
    (And.intro E.conversionProfileClosed
      (And.intro E.residenceTimeClosed
        (And.intro E.reactorVolumeClosed
          (And.intro E.optimalConditionsClosed
            (And.intro E.catalystActivityClosed
              E.deactivationModelClosed)))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
