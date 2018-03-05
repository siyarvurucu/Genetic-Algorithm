# Assigning Students to Courses using Genetic Algorithm

Assign each on N students to one of K courses with limited
capacity. Students indicates their preferences. Our aim is to maximize satisfaction of preferences as
far as the following constraints permits:
- Each student should be assigned to exactly one course
- Course capacities should not be exceeded

Description of input meta parameters:
- Number of offered courses: K=4
- Maximum capacity of courses: 8 students
- Crowdness depends on number of total students (N)
  a) Low: N=20
  b) High: N=30
- Popularity of courses (vector): 
  Popularity[4]
  - Balanced: Popularity=[5, 5, 5, 5]
  - Unbalanced: Popularity=[10, 5, 5, 2]
  
Elective course preference simulation:

Preference[N, 4] is the matrix indicating course preferences of the students. P[k, -] is the row vector
showing the preference of student k, each component having preference value.

For example; P[k, -]=[2, 1 , 4, 3]
Selection of 1st preference: One of the courses i=1…4 is selected randomly according to distribution
Pi=Popularity[i] / (sum(Popularity[k], k=1…4))

Selection of the other preferences: Remove the selected course from the course set, and repeat the
selection considering popularity of the remaining courses.

EA metaparameters (Population size, Crossover rate, Mutation rate, tournament size etc.) are to be
determined by experimentation.

Selection of parents for crossover: Tournament selection
Selection for next generation: Roulette wheel

**GA Algorithm Input:**
- Crowdness, Popularity
- A randomly created Preference matrix
- Meta parameters (suggested values)
- How many generations to continue (0 means stop)

GA Algorithm Output:
- For each generation repeatedly show:
  - Generation number
  - Calculated Cost for the best chromosome
  - Fitness of the best chromosome
- If number of generations completed, show the solution:
Class lists for each course, which is the solution represented by the best chromosome, together with
information on preference for the course assigned
- Ask how many generations to continue (0 means stop)
- If 0 entered then plot fitness vs generation number and then stop
Example fpr input:
Crowdness=Low,
Popularity=Unbalanced

PREFERENCE
C1 C2 C3 C4
S1 1 2 3 4
S2 2 1 3 4
S3 1 3 4 2
S4 3 1 2 4
S5 1 2 4 3
S6 2 3 1 4
S7 1 3 2 4
S8 3 1 4 2
S9 4 1 2 3
S10 3 1 2 4
S11 1 2 3 4
S12 2 1 3 4
S13 1 3 2 4
S14 4 3 1 2
S15 3 2 1 4
S16 2 4 1 3
S17 1 2 4 3
S18 3 4 2 1
S19 1 3 2 4
S20 1 2 3 4
Population size: ...
Cross over rate: ...
Mutation rate:...

