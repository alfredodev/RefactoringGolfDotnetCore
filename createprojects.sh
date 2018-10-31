for round in 1 2 3 4 5
do
    dotnet new classlib -n Round$round.A -o Round$round.A
    rm Round$round.A/Class1.cs
    dotnet sln add Round$round.A/Round$round.A.csproj
    
    dotnet new classlib -n Round$round.B -o Round$round.B
    rm Round$round.B/Class1.cs
    dotnet sln add Round$round.B/Round$round.B.csproj
done

for round in 2 3 5
do
    dotnet new xunit -n Round$round.A.Tests -o Round$round.A.Tests
    dotnet sln add Round$round.A.Tests/Round$round.A.Tests.csproj
    rm Round$round.A.Tests/UnitTest1.cs
done

for round in 1 2 3 4 5
do
    dotnet new xunit -n Round$round.B.Tests -o Round$round.B.Tests
    dotnet sln add Round$round.B.Tests/Round$round.B.Tests.csproj
    rm Round$round.B.Tests/UnitTest1.cs
done

rsync -a --include '*/' --include '*.cs' --exclude '*' /Users/alfredodev/Documents/katas/dotnet/RefactoringGolfCSharp/ .
