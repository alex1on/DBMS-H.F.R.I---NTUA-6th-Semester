use project;

CREATE INDEX idx_date_of_birth ON Researcher(Date_of_Birth);
CREATE INDEX idx_starting_date ON Project(Starting_Date);
CREATE INDEX idx_ending_date ON Project(Ending_Date);
CREATE INDEX idx_r_organization_id ON Researcher(R_Organization_ID);
CREATE INDEX idx_p_organization_id ON Project(Organization_ID);
CREATE INDEX idx_date_of_entry ON Researcher(Date_of_Entry);
