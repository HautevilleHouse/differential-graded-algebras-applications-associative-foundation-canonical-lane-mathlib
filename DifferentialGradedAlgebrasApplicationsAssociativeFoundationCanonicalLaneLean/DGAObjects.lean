import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGASpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DGAAdmittedObject where
  space : DGASpace
  differentialGradedAlgebra : Prop
  associative : Prop
  unit : Prop
  conclusion : differentialGradedAlgebra ∧ associative ∧ unit

def DGAWitnessClosed (O : DGAAdmittedObject) : Prop :=
  O.differentialGradedAlgebra ∧ O.associative ∧ O.unit

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
