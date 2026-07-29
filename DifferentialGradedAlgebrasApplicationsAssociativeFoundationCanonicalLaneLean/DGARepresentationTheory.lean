import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGModule (A : DGAlgebraPackage) where
  carrier : Type u
  action : A.algebra.carrier → carrier → carrier
  add : carrier → carrier → carrier
  zero : carrier
  add_assoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  add_comm : ∀ x y : carrier, add x y = add y x
  add_zero : ∀ x : carrier, add x zero = x
  zero_add : ∀ x : carrier, add zero x = x
  action_mul : ∀ a b : A.algebra.carrier, ∀ x : carrier, action (A.algebra.mul a b) x = action a (action b x)
  action_one : ∀ x : carrier, action A.algebra.one x = x
  action_add : ∀ a : A.algebra.carrier, ∀ x y : carrier, action a (add x y) = add (action a x) (action a y)
  action_zero : ∀ x : carrier, action A.algebra.zero x = zero

structure DGModulePackage (A : DGAlgebraPackage) where
  module : DGModule A
  finiteDimensional : Prop
  semisimple : Prop

structure DGModuleEvidence (A : DGAlgebraPackage) (P : DGModulePackage A) where
  finiteDimensionalClosed : P.finiteDimensional
  semisimpleClosed : P.semisimple

def DGModuleClosed (A : DGAlgebraPackage) (P : DGModulePackage A) : Prop :=
  P.finiteDimensional ∧ P.semisimple

theorem dg_module_closed_from_evidence (A : DGAlgebraPackage) (P : DGModulePackage A) (E : DGModuleEvidence A P) :
    DGModuleClosed A P := by
  exact And.intro E.finiteDimensionalClosed E.semisimpleClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse