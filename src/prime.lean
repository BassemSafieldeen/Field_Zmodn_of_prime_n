def divides (a : ℤ) (b : ℤ) := ∃ m, b = a * m

def prime (n : ℕ) :=
∀ a b, divides n (a * b) → (divides n a) ∨ (divides n b)