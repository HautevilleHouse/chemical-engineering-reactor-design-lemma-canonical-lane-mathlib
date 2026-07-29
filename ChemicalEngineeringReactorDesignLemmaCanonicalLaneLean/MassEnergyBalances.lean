import ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean.ReactorKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure MassEnergyBalancePackage where
  materialBalance : Prop
  energyBalance : Prop
  heatTransferModel : Prop
  pressureDropCorrelation : Prop
  speciesContinuity : Prop
  enthalpyConservation : Prop
  massTransferTerms : Prop

structure MassEnergyBalanceEvidence (B : MassEnergyBalancePackage) where
  materialBalanceClosed : B.materialBalance
  energyBalanceClosed : B.energyBalance
  heatTransferModelClosed : B.heatTransferModel
  pressureDropCorrelationClosed : B.pressureDropCorrelation
  speciesContinuityClosed : B.speciesContinuity
  enthalpyConservationClosed : B.enthalpyConservation
  massTransferTermsClosed : B.massTransferTerms

def MassEnergyBalanceClosed (B : MassEnergyBalancePackage) : Prop :=
  B.materialBalance ∧ B.energyBalance ∧ B.heatTransferModel ∧
  B.pressureDropCorrelation ∧ B.speciesContinuity ∧
  B.enthalpyConservation ∧ B.massTransferTerms

theorem mass_energy_balance_closed_from_evidence (B : MassEnergyBalancePackage)
    (E : MassEnergyBalanceEvidence B) : MassEnergyBalanceClosed B := by
  exact And.intro E.materialBalanceClosed
    (And.intro E.energyBalanceClosed
      (And.intro E.heatTransferModelClosed
        (And.intro E.pressureDropCorrelationClosed
          (And.intro E.speciesContinuityClosed
            (And.intro E.enthalpyConservationClosed
              E.massTransferTermsClosed)))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
