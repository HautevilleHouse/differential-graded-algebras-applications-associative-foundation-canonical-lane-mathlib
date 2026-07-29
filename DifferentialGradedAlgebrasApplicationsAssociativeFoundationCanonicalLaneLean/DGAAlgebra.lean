import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebra (R : Type u) [CommRing R] where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  mul : carrier → carrier → carrier
  one : carrier
  differential : carrier → carrier
  grading : ℤ → carrier → Prop
  differential_grading : ∀ (x : carrier) (n : ℤ), grading n x → grading (n+1 : ℤ) (differential x)
  differential_sq_zero : differential ∘ differential = λ x => zero
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  add_comm : ∀ a b : carrier, add a b = add b a
  add_zero : ∀ a : carrier, add a zero = a
  zero_add : ∀ a : carrier, add zero a = a
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  mul_one : ∀ a : carrier, mul a one = a
  one_mul : ∀ a : carrier, mul one a = a
  left_distrib : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  right_distrib : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  differential_leibniz : ∀ x y : carrier, differential (mul x y) = add (mul (differential x) y) (mul x (differential y))

structure DGAlgebraPackage where
  ring : Type u
  [commRing : CommRing ring]
  algebra : DGAlgebra ring
  nonzero : Prop
  finiteType : Prop

structure DGAlgebraEvidence (P : DGAlgebraPackage) where
  nonzeroClosed : P.nonzero
  finiteTypeClosed : P.finiteType

def DGAlgebraClosed (P : DGAlgebraPackage) : Prop :=
  P.nonzero ∧ P.finiteType

theorem dg_algebra_closed_from_evidence (P : DGAlgebraPackage) (E : DGAlgebraEvidence P) :
    DGAlgebraClosed P := by
  exact And.intro E.nonzeroClosed E.finiteTypeClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse