import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean

structure HeatTransferPackage where
  heatTransferCoefficient : Prop
  heatTransferArea : Prop
  coolantTemperature : Prop
  reactionEnthalpy : Prop
  energyBalanceEquation : Prop
  temperatureProfile : Prop
  heatExchangerDesign : Prop

structure HeatTransferEvidence (H : HeatTransferPackage) where
  heatTransferCoefficientClosed : H.heatTransferCoefficient
  heatTransferAreaClosed : H.heatTransferArea
  coolantTemperatureClosed : H.coolantTemperature
  reactionEnthalpyClosed : H.reactionEnthalpy
  energyBalanceEquationClosed : H.energyBalanceEquation
  temperatureProfileClosed : H.temperatureProfile
  heatExchangerDesignClosed : H.heatExchangerDesign

def HeatTransferPackageClosed (H : HeatTransferPackage) : Prop :=
  H.heatTransferCoefficient ∧ H.heatTransferArea ∧ H.coolantTemperature ∧
  H.reactionEnthalpy ∧ H.energyBalanceEquation ∧ H.temperatureProfile ∧
  H.heatExchangerDesign

theorem heat_transfer_package_closed_from_evidence (H : HeatTransferPackage) (E : HeatTransferEvidence H) :
    HeatTransferPackageClosed H := by
  exact And.intro E.heatTransferCoefficientClosed
    (And.intro E.heatTransferAreaClosed
      (And.intro E.coolantTemperatureClosed
        (And.intro E.reactionEnthalpyClosed
          (And.intro E.energyBalanceEquationClosed
            (And.intro E.temperatureProfileClosed E.heatExchangerDesignClosed)))))

end ChemicalEngineeringReactorDesignLemmaCanonicalLaneLean
end HautevilleHouse
